; ModuleID = 'linux_bc/pass/INTERVAL_test_36-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_36-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.ar = private unnamed_addr constant [4 x i32] [i32 1, i32 2, i32 3, i32 5], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32*, align 8
  %ar = alloca [4 x i32], align 16
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %i, metadata !14, metadata !DIExpression()), !dbg !16
  %call = call noalias align 16 i8* @malloc(i64 16) #5, !dbg !17
  %0 = bitcast i8* %call to i32*, !dbg !17
  store i32* %0, i32** %i, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [4 x i32]* %ar, metadata !18, metadata !DIExpression()), !dbg !22
  %1 = bitcast [4 x i32]* %ar to i8*, !dbg !22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([4 x i32]* @__const.main.ar to i8*), i64 16, i1 false), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32, i32* %a, align 4, !dbg !25
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 3, !dbg !26
  store i32 %2, i32* %arrayidx, align 4, !dbg !27
  %3 = load i32*, i32** %i, align 8, !dbg !28
  %4 = bitcast i32* %3 to i8*, !dbg !29
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %ar, i64 0, i64 0, !dbg !29
  %5 = bitcast i32* %arraydecay to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 16, i1 false), !dbg !29
  %6 = load i32*, i32** %i, align 8, !dbg !30
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 3, !dbg !30
  %7 = load i32, i32* %arrayidx1, align 4, !dbg !30
  %cmp = icmp sgt i32 %7, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %i, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 3, !dbg !34
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !34
  %cmp3 = icmp sgt i32 %9, 5, !dbg !36
  call void @svf_assert(i1 zeroext %cmp3), !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  %10 = load i32*, i32** %i, align 8, !dbg !39
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 3, !dbg !39
  %11 = load i32, i32* %arrayidx4, align 4, !dbg !39
  %cmp5 = icmp sle i32 %11, 5, !dbg !41
  call void @svf_assert(i1 zeroext %cmp5), !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %12, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @svf_assert(i1 zeroext) #4

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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_36-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_36-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = !DILocation(line: 9, column: 10, scope: !9)
!17 = !DILocation(line: 9, column: 14, scope: !9)
!18 = !DILocalVariable(name: "ar", scope: !9, file: !10, line: 10, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 4)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!24 = !DILocation(line: 11, column: 9, scope: !9)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 12, column: 5, scope: !9)
!27 = !DILocation(line: 12, column: 11, scope: !9)
!28 = !DILocation(line: 13, column: 12, scope: !9)
!29 = !DILocation(line: 13, column: 5, scope: !9)
!30 = !DILocation(line: 14, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 9)
!32 = !DILocation(line: 14, column: 14, scope: !31)
!33 = !DILocation(line: 14, column: 9, scope: !9)
!34 = !DILocation(line: 15, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 14, column: 19)
!36 = !DILocation(line: 15, column: 25, scope: !35)
!37 = !DILocation(line: 15, column: 9, scope: !35)
!38 = !DILocation(line: 16, column: 5, scope: !35)
!39 = !DILocation(line: 18, column: 20, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !10, line: 17, column: 10)
!41 = !DILocation(line: 18, column: 25, scope: !40)
!42 = !DILocation(line: 18, column: 9, scope: !40)
!43 = !DILocation(line: 20, column: 1, scope: !9)
