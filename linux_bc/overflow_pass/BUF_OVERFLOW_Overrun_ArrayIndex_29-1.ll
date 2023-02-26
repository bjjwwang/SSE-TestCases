; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.ar = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 5], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32*, align 8
  %ar = alloca [4 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %i, metadata !19, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 16) #5, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %i, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata [4 x i32]* %ar, metadata !23, metadata !DIExpression()), !dbg !27
  %1 = bitcast [4 x i32]* %ar to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.ar to i8*), i64 16, i1 false), !dbg !27
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !28
  call void @srand(i32 %call1) #5, !dbg !29
  call void @llvm.dbg.declare(metadata i32* %a, metadata !30, metadata !DIExpression()), !dbg !31
  %call2 = call i32 @rand() #5, !dbg !32
  %rem = srem i32 %call2, 51, !dbg !33
  store i32 %rem, i32* %a, align 4, !dbg !31
  %2 = load i32, i32* %a, align 4, !dbg !34
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 3, !dbg !35
  store i32 %2, i32* %arrayidx, align 4, !dbg !36
  %3 = load i32*, i32** %i, align 8, !dbg !37
  %4 = bitcast i32* %3 to i8*, !dbg !38
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 0, !dbg !38
  %5 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 16, i1 false), !dbg !38
  %6 = load i32*, i32** %i, align 8, !dbg !39
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 2, !dbg !39
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !39
  %cmp = icmp sgt i32 %7, 2, !dbg !41
  br i1 %cmp, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  %arrayidx4 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !43
  store i32 1, i32* %arrayidx4, align 4, !dbg !45
  br label %if.end, !dbg !46

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %i, align 8, !dbg !47
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 3, !dbg !47
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !47
  %idxprom = sext i32 %9 to i64, !dbg !49
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !49
  store i32 1, i32* %arrayidx6, align 4, !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %10, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_29-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!21 = !DILocation(line: 9, column: 10, scope: !9)
!22 = !DILocation(line: 9, column: 14, scope: !9)
!23 = !DILocalVariable(name: "ar", scope: !9, file: !10, line: 10, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 4)
!27 = !DILocation(line: 10, column: 9, scope: !9)
!28 = !DILocation(line: 11, column: 11, scope: !9)
!29 = !DILocation(line: 11, column: 5, scope: !9)
!30 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!31 = !DILocation(line: 12, column: 6, scope: !9)
!32 = !DILocation(line: 12, column: 10, scope: !9)
!33 = !DILocation(line: 12, column: 17, scope: !9)
!34 = !DILocation(line: 14, column: 13, scope: !9)
!35 = !DILocation(line: 14, column: 5, scope: !9)
!36 = !DILocation(line: 14, column: 11, scope: !9)
!37 = !DILocation(line: 15, column: 12, scope: !9)
!38 = !DILocation(line: 15, column: 5, scope: !9)
!39 = !DILocation(line: 16, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !9, file: !10, line: 16, column: 9)
!41 = !DILocation(line: 16, column: 14, scope: !40)
!42 = !DILocation(line: 16, column: 9, scope: !9)
!43 = !DILocation(line: 17, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !10, line: 16, column: 19)
!45 = !DILocation(line: 17, column: 19, scope: !44)
!46 = !DILocation(line: 18, column: 5, scope: !44)
!47 = !DILocation(line: 21, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !10, line: 19, column: 10)
!49 = !DILocation(line: 21, column: 9, scope: !48)
!50 = !DILocation(line: 21, column: 22, scope: !48)
!51 = !DILocation(line: 23, column: 1, scope: !9)
