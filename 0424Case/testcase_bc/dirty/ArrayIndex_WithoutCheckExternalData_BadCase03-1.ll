; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/dirty/ArrayIndex_WithoutCheckExternalData_BadCase03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_03(i8* noundef %p, i32 noundef %len) #0 !dbg !9 {
entry:
  %p.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %p.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %1 = load i32, i32* %len.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %0, %1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !31
  %conv = trunc i32 %2 to i8, !dbg !31
  %3 = load i8*, i8** %p.addr, align 8, !dbg !33
  %4 = load i32, i32* %i, align 4, !dbg !34
  %idx.ext = sext i32 %4 to i64, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 %idx.ext, !dbg !35
  store i8 %conv, i8* %add.ptr, align 1, !dbg !36
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !38
  %inc = add nsw i32 %5, 1, !dbg !38
  store i32 %inc, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %p = alloca [2 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i8]* %p, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %p, i64 0, i64 0, !dbg !53
  call void @test_bad_03(i8* noundef %arraydecay, i32 noundef 3), !dbg !54
  ret i32 0, !dbg !55
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "test_bad_03", scope: !10, file: !10, line: 12, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "dirty/ArrayIndex_WithoutCheckExternalData_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 12, type: !13)
!18 = !DILocation(line: 12, column: 33, scope: !9)
!19 = !DILocalVariable(name: "len", arg: 2, scope: !9, file: !10, line: 12, type: !15)
!20 = !DILocation(line: 12, column: 40, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 14, type: !15)
!22 = !DILocation(line: 14, column: 9, scope: !9)
!23 = !DILocation(line: 15, column: 12, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 5)
!25 = !DILocation(line: 15, column: 10, scope: !24)
!26 = !DILocation(line: 15, column: 17, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !10, line: 15, column: 5)
!28 = !DILocation(line: 15, column: 21, scope: !27)
!29 = !DILocation(line: 15, column: 19, scope: !27)
!30 = !DILocation(line: 15, column: 5, scope: !24)
!31 = !DILocation(line: 17, column: 20, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !10, line: 15, column: 31)
!33 = !DILocation(line: 17, column: 11, scope: !32)
!34 = !DILocation(line: 17, column: 15, scope: !32)
!35 = !DILocation(line: 17, column: 13, scope: !32)
!36 = !DILocation(line: 17, column: 18, scope: !32)
!37 = !DILocation(line: 18, column: 5, scope: !32)
!38 = !DILocation(line: 15, column: 27, scope: !27)
!39 = !DILocation(line: 15, column: 5, scope: !27)
!40 = distinct !{!40, !30, !41, !42}
!41 = !DILocation(line: 18, column: 5, scope: !24)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 19, column: 1, scope: !9)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 22, type: !45, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!45 = !DISubroutineType(types: !46)
!46 = !{!15}
!47 = !DILocalVariable(name: "p", scope: !44, file: !10, line: 24, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 16, elements: !50)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !{!51}
!51 = !DISubrange(count: 2)
!52 = !DILocation(line: 24, column: 10, scope: !44)
!53 = !DILocation(line: 25, column: 17, scope: !44)
!54 = !DILocation(line: 25, column: 5, scope: !44)
!55 = !DILocation(line: 26, column: 5, scope: !44)
