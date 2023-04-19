; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/Overrun_Not_Verify_Max_Value_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/Overrun_Not_Verify_Max_Value_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [15 x i8] c"some_file_path\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"read_link error\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad01() #0 !dbg !9 {
entry:
  %filePath = alloca [128 x i8], align 16
  %r = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [128 x i8]* %filePath, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [128 x i8]* %filePath to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 128, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %r, metadata !20, metadata !DIExpression()), !dbg !22
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %filePath, i64 0, i64 0, !dbg !23
  %call = call i64 @readlink(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay, i64 noundef 128), !dbg !24
  %conv = trunc i64 %call to i32, !dbg !24
  store i32 %conv, i32* %r, align 4, !dbg !22
  %1 = load i32, i32* %r, align 4, !dbg !25
  %cmp = icmp eq i32 %1, -1, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !29
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %r, align 4, !dbg !32
  %idxprom = sext i32 %2 to i64, !dbg !33
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* %filePath, i64 0, i64 %idxprom, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %return, !dbg !35

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @readlink(i8* noundef, i8* noundef, i64 noundef) #3

declare i32 @printf(i8* noundef, ...) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/Overrun_Not_Verify_Max_Value_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestCaseBad01", scope: !10, file: !10, line: 13, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/Overrun_Not_Verify_Max_Value_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "filePath", scope: !9, file: !10, line: 15, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1024, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 128)
!19 = !DILocation(line: 15, column: 10, scope: !9)
!20 = !DILocalVariable(name: "r", scope: !9, file: !10, line: 16, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 16, column: 9, scope: !9)
!23 = !DILocation(line: 16, column: 40, scope: !9)
!24 = !DILocation(line: 16, column: 13, scope: !9)
!25 = !DILocation(line: 17, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 17, column: 9)
!27 = !DILocation(line: 17, column: 11, scope: !26)
!28 = !DILocation(line: 17, column: 9, scope: !9)
!29 = !DILocation(line: 18, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 17, column: 18)
!31 = !DILocation(line: 19, column: 9, scope: !30)
!32 = !DILocation(line: 22, column: 14, scope: !9)
!33 = !DILocation(line: 22, column: 5, scope: !9)
!34 = !DILocation(line: 22, column: 17, scope: !9)
!35 = !DILocation(line: 24, column: 1, scope: !9)
