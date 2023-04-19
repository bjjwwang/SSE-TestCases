; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/ArrayIndex_WithoutCheckExternalData_BadCase11.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/ArrayIndex_WithoutCheckExternalData_BadCase11.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.test_bad_04.arr = private unnamed_addr constant [6 x i8] c"12345\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_04() #0 !dbg !11 {
entry:
  %ptr = alloca i8*, align 8
  %arr = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [6 x i8]* %arr, metadata !20, metadata !DIExpression()), !dbg !24
  %0 = bitcast [6 x i8]* %arr to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([6 x i8], [6 x i8]* @__const.test_bad_04.arr, i32 0, i32 0), i64 6, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [6 x i8], [6 x i8]* %arr, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %ptr, align 8, !dbg !26
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !28
  %cmp = icmp ne i8* %1, null, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !33
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1, !dbg !33
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !33
  %3 = load i8, i8* %2, align 1, !dbg !36
  %conv = sext i8 %3 to i32, !dbg !36
  %cmp1 = icmp eq i32 %conv, 5, !dbg !37
  br i1 %cmp1, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %for.body
  %4 = load i8*, i8** %ptr, align 8, !dbg !39
  %incdec.ptr3 = getelementptr inbounds i8, i8* %4, i32 1, !dbg !39
  store i8* %incdec.ptr3, i8** %ptr, align 8, !dbg !39
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end
  %5 = load i8*, i8** %ptr, align 8, !dbg !43
  %incdec.ptr4 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !43
  store i8* %incdec.ptr4, i8** %ptr, align 8, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0, !dbg !53
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/ArrayIndex_WithoutCheckExternalData_BadCase11.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "test_bad_04", scope: !12, file: !12, line: 12, type: !13, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "general/ArrayIndex_WithoutCheckExternalData_BadCase11.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "ptr", scope: !11, file: !12, line: 14, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 14, column: 12, scope: !11)
!20 = !DILocalVariable(name: "arr", scope: !11, file: !12, line: 15, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 48, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 6)
!24 = !DILocation(line: 15, column: 10, scope: !11)
!25 = !DILocation(line: 16, column: 11, scope: !11)
!26 = !DILocation(line: 16, column: 9, scope: !11)
!27 = !DILocation(line: 17, column: 5, scope: !11)
!28 = !DILocation(line: 17, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 17, column: 5)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 17, column: 5)
!31 = !DILocation(line: 17, column: 16, scope: !29)
!32 = !DILocation(line: 17, column: 5, scope: !30)
!33 = !DILocation(line: 18, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !12, line: 18, column: 13)
!35 = distinct !DILexicalBlock(scope: !29, file: !12, line: 17, column: 32)
!36 = !DILocation(line: 18, column: 13, scope: !34)
!37 = !DILocation(line: 18, column: 20, scope: !34)
!38 = !DILocation(line: 18, column: 13, scope: !35)
!39 = !DILocation(line: 20, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !12, line: 18, column: 26)
!41 = !DILocation(line: 21, column: 9, scope: !40)
!42 = !DILocation(line: 22, column: 5, scope: !35)
!43 = !DILocation(line: 17, column: 28, scope: !29)
!44 = !DILocation(line: 17, column: 5, scope: !29)
!45 = distinct !{!45, !32, !46, !47}
!46 = !DILocation(line: 22, column: 5, scope: !30)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 23, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 26, type: !50, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!52}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DILocation(line: 28, column: 5, scope: !49)
