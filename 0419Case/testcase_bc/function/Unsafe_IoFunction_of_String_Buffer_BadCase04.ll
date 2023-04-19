; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/Unsafe_IoFunction_of_String_Buffer_BadCase04.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/Unsafe_IoFunction_of_String_Buffer_BadCase04.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"123\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Unsafe_IoFunction_of_String_Buffer_case01_Bad_05() #0 !dbg !9 {
entry:
  %buffer = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata [10 x i8]* %buffer, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i8]* %buffer to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !19
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !20
  %call = call i32 (i8*, i8*, ...) @sscanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %arraydecay), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @sscanf(i8* noundef, i8* noundef, ...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @Unsafe_IoFunction_of_String_Buffer_case01_Bad_04() #0 !dbg !23 {
entry:
  %buffer = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata [10 x i8]* %buffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = bitcast [10 x i8]* %buffer to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !25
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buffer, i64 0, i64 0, !dbg !26
  %call = call i32 (i8*, i8*, ...) @sscanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %arraydecay), !dbg !27
  ret void, !dbg !28
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/Unsafe_IoFunction_of_String_Buffer_BadCase04.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "Unsafe_IoFunction_of_String_Buffer_case01_Bad_05", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/Unsafe_IoFunction_of_String_Buffer_BadCase04.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 11, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 11, column: 10, scope: !9)
!20 = !DILocation(line: 13, column: 25, scope: !9)
!21 = !DILocation(line: 13, column: 5, scope: !9)
!22 = !DILocation(line: 14, column: 1, scope: !9)
!23 = distinct !DISubprogram(name: "Unsafe_IoFunction_of_String_Buffer_case01_Bad_04", scope: !10, file: !10, line: 17, type: !11, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!24 = !DILocalVariable(name: "buffer", scope: !23, file: !10, line: 19, type: !15)
!25 = !DILocation(line: 19, column: 7, scope: !23)
!26 = !DILocation(line: 21, column: 23, scope: !23)
!27 = !DILocation(line: 21, column: 5, scope: !23)
!28 = !DILocation(line: 22, column: 1, scope: !23)
