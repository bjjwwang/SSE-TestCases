; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %a, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %a, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %b, align 4, !dbg !22
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !23
  call void @srand(i32 %call) #5, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %c, metadata !25, metadata !DIExpression()), !dbg !26
  %call1 = call i32 @rand() #5, !dbg !27
  %rem = srem i32 %call1, 11, !dbg !28
  store i32 %rem, i32* %c, align 4, !dbg !26
  br label %LOOP, !dbg !29

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  %0 = load i32, i32* %a, align 4, !dbg !32
  %1 = load i32, i32* %c, align 4, !dbg !34
  %cmp = icmp slt i32 %0, %1, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %LOOP
  %2 = load i32, i32* %a, align 4, !dbg !37
  %inc = add nsw i32 %2, 1, !dbg !37
  store i32 %inc, i32* %a, align 4, !dbg !37
  %3 = load i32, i32* %b, align 4, !dbg !39
  %add = add nsw i32 %3, 2, !dbg !40
  store i32 %add, i32* %b, align 4, !dbg !41
  br label %LOOP, !dbg !42

if.end:                                           ; preds = %LOOP
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 0, !dbg !43
  %4 = bitcast i32* %arraydecay to i8*, !dbg !43
  %5 = load i32, i32* %a, align 4, !dbg !44
  %conv = sext i32 %5 to i64, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 97, i64 %conv, i1 false), !dbg !43
  %arraydecay2 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 0, !dbg !45
  %6 = bitcast i32* %arraydecay2 to i8*, !dbg !45
  %7 = load i32, i32* %b, align 4, !dbg !46
  %conv3 = sext i32 %7 to i64, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 97, i64 %conv3, i1 false), !dbg !45
  %8 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %8, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memset_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 10)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!20 = !DILocation(line: 9, column: 6, scope: !9)
!21 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 11, column: 11, scope: !9)
!24 = !DILocation(line: 11, column: 5, scope: !9)
!25 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 12, type: !13)
!26 = !DILocation(line: 12, column: 9, scope: !9)
!27 = !DILocation(line: 12, column: 13, scope: !9)
!28 = !DILocation(line: 12, column: 20, scope: !9)
!29 = !DILocation(line: 12, column: 5, scope: !9)
!30 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 14)
!31 = !DILocation(line: 14, column: 5, scope: !9)
!32 = !DILocation(line: 15, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 8)
!34 = !DILocation(line: 15, column: 12, scope: !33)
!35 = !DILocation(line: 15, column: 10, scope: !33)
!36 = !DILocation(line: 15, column: 8, scope: !9)
!37 = !DILocation(line: 16, column: 10, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !10, line: 15, column: 15)
!39 = !DILocation(line: 17, column: 13, scope: !38)
!40 = !DILocation(line: 17, column: 15, scope: !38)
!41 = !DILocation(line: 17, column: 11, scope: !38)
!42 = !DILocation(line: 18, column: 9, scope: !38)
!43 = !DILocation(line: 22, column: 2, scope: !9)
!44 = !DILocation(line: 22, column: 22, scope: !9)
!45 = !DILocation(line: 23, column: 2, scope: !9)
!46 = !DILocation(line: 23, column: 22, scope: !9)
!47 = !DILocation(line: 24, column: 1, scope: !9)
