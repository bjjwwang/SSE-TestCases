; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/SprintfPackaged_DestOverflow_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/SprintfPackaged_DestOverflow_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.cwe120_c_29.printStr = private unnamed_addr constant [27 x i8] c"Hello world, good morning!\00", align 16
@.str = private unnamed_addr constant [4 x i8] c"abc\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_29() #0 !dbg !9 {
entry:
  %dest = alloca [8 x i8], align 1
  %printStr = alloca [27 x i8], align 16
  call void @llvm.dbg.declare(metadata [8 x i8]* %dest, metadata !14, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [27 x i8]* %printStr, metadata !20, metadata !DIExpression()), !dbg !24
  %0 = bitcast [27 x i8]* %printStr to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([27 x i8], [27 x i8]* @__const.cwe120_c_29.printStr, i32 0, i32 0), i64 27, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %dest, i64 0, i64 0, !dbg !25
  %arraydecay1 = getelementptr inbounds [27 x i8], [27 x i8]* %printStr, i64 0, i64 0, !dbg !25
  %call = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay, i32 noundef 0, i64 noundef 8, i8* noundef %arraydecay1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @__sprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @cwe120_c_29(), !dbg !31
  ret i32 0, !dbg !32
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/SprintfPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_29", scope: !10, file: !10, line: 16, type: !11, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/SprintfPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 18, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 64, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 8)
!19 = !DILocation(line: 18, column: 10, scope: !9)
!20 = !DILocalVariable(name: "printStr", scope: !9, file: !10, line: 19, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 216, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 27)
!24 = !DILocation(line: 19, column: 10, scope: !9)
!25 = !DILocation(line: 21, column: 5, scope: !9)
!26 = !DILocation(line: 22, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 23, type: !28, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 25, column: 5, scope: !27)
!32 = !DILocation(line: 26, column: 5, scope: !27)
